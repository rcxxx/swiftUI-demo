//
//  ContentView.swift
//  ReplayKit-Demo
//
//  Created by RCXXX on 2021/3/12.
//

import SwiftUI
import ReplayKit

struct ContentView: View {
    let view = myWebView(url: "https://ditu.amap.com")
    
    private let recorder = RPScreenRecorder.shared()
    
    @State var rp: RPPreviewView!
    
    @State private var isRecording = false
    @State private var isPreview = false
    
    
    var body: some View {
        VStack {
            self.view
                .ignoresSafeArea()
                .padding()
            
            HStack() {
                Spacer()
                
                Button(action: {
                    if !self.isRecording {
                        self.startRecord()
                    } else {
                        self.stopRecord()
                    }
                }, label: {
                    Image(systemName: isRecording ? "stop.circle" : "video.circle")
                })
                .padding()
                .frame(width: 100, height: 50.0)
                .background(isRecording ? Color.red : Color.green)
                .foregroundColor(.white)
                .cornerRadius(15)
                
                
                Spacer()
                
                Button(action: {
                    self.isPreview = true
                }, label: {
                    Text("Preview")
                })
                .padding()
                .frame(width: 100, height: 50.0)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
                .sheet(isPresented: $isPreview) {
                    self.rp.edgesIgnoringSafeArea(.all)
                        .transition(.move(edge: .bottom))
                }
                
                Spacer()
            }
        }
    }
    
    private func startRecord() {
        guard recorder.isAvailable else {
            print("Recording is not available at this time")
            return
        }
        
        if !recorder.isRecording {
            recorder.startRecording {
                (error) in
                guard error == nil else {
                    print("There was an error starting the recording.")
                    return
                }
                
                print("Started Recording Successfully")
                self.isRecording = true
            }
        }
    }
    
    private func stopRecord() {
        recorder.stopRecording {
            (preview, error) in
            print("Stopped recording")
            self.isRecording = false
            
            guard let preview = preview else {
                print("Preview controller is not available")
                return
            }
            self.rp = RPPreviewView(rpPreviewViewController: preview, enablePreview: $isPreview)
            
            withAnimation {
                self.isPreview = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
