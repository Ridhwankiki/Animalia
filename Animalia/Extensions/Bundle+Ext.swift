//
//  Bundle+Ext.swift
//  Animalia
//
//  Created by MacBook Pro on 29/04/24.
//

import Foundation


// Gunanya untuk decode data kson sebagai bundle (bundle data)
// Jadi bisa do reuse anytime anywhere all at once
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Menentukan lokasi dari file json
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // 2. Kita set data nya
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        // 3. Buat decoder nya
        let decoder = JSONDecoder()
        
        // 4. Simpan sebagai property dari data json yang sudah di decode
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 5. Return data yang sudah di decode dan ready-to use
        return loaded
    }
}
