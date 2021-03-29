//
//  Replay.swift
//  ReplayKit-Demo
//
//  Created by RCXXX on 2021/3/12.
//

import SwiftUI
import ReplayKit

struct RPPreviewView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    let rpPreviewViewController: RPPreviewViewController
    @Binding var enablePreview: Bool

    func makeUIViewController(context: Context) -> RPPreviewViewController {
        rpPreviewViewController.previewControllerDelegate = context.coordinator
        rpPreviewViewController.modalPresentationStyle = .fullScreen

        return rpPreviewViewController
    }

    func updateUIViewController(_ uiViewController: RPPreviewViewController, context: Context) { }

    class Coordinator: NSObject, RPPreviewViewControllerDelegate {
        var parent: RPPreviewView

        init(_ parent: RPPreviewView) {
            self.parent = parent
        }

        func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
            parent.enablePreview = false
        }
    }
}
