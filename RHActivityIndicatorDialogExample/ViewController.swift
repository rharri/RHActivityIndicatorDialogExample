//
//  ViewController.swift
//  RHActivityIndicatorDialogExample
//
//  Created by Ryan Harri on 2017-05-24.
//
//  Modified BSD License
//
//  Copyright (c) 2017-Present, Ryan Harri. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
//  * Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
//
//  * Neither the name Ryan Harri nor the names of its contributors may be used
//    to endorse or promote products derived from this software without
//    specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
//  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
//  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR
//  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import UIKit
import RHActivityIndicatorDialog

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var showButton: UIBarButtonItem!
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    
    // MARK: - Instance Properties
    
    private var dialog: RHActivityIndicatorDialog!
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissButton.isEnabled = false
    }
    
    // MARK: - Actions
    
    @IBAction func showDialog(_ sender: UIBarButtonItem) {
        dialog = RHActivityIndicatorDialog(text: "Turning Off Reminders...")
        
        self.view.addSubview(dialog)
        
        dismissButton.isEnabled = true
        showButton.isEnabled = false
    }
    
    @IBAction func dismissDialog(_ sender: UIBarButtonItem) {
        dialog.dismiss {
            DispatchQueue.main.async {
                self.showButton.isEnabled = true
                self.dismissButton.isEnabled = false
            }
        }
    }
}
