//
//  NSDocument+SharingService.swift
//
//  CotEditor
//  https://coteditor.com
//
//  Created by 1024jp on 2017-12-25.
//
//  ---------------------------------------------------------------------------
//
//  © 2017 1024jp
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  https://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import AppKit

extension NSDocument {
    
    /// show Share Service menu
    @IBAction func share(_ sender: Any?) {
        
        guard let view = sender as? NSView else { return }
        
        let items: [URL] = {
            guard let url = self.fileURL else { return [] }
            
            return [url]
        }()
        let sharingServicePicker = NSSharingServicePicker(items: items)
        
        sharingServicePicker.delegate = self
        sharingServicePicker.show(relativeTo: view.bounds, of: view, preferredEdge: .minY)
    }
    
}


extension NSDocument: NSSharingServiceDelegate {
    
    /// specify the window to show sharing view
    public func sharingService(_ sharingService: NSSharingService, sourceWindowForShareItems items: [Any], sharingContentScope: UnsafeMutablePointer<NSSharingService.SharingContentScope>) -> NSWindow? {
        
        return self.windowForSheet
    }
    
}


extension NSDocument: NSSharingServicePickerDelegate {
    
    /// specify sharing service delegate
    public func sharingServicePicker(_ sharingServicePicker: NSSharingServicePicker, delegateFor sharingService: NSSharingService) -> NSSharingServiceDelegate? {
        
        return self
    }
    
}
