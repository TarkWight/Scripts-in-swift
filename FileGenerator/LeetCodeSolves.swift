import Foundation

let names = []
let extensions = []

let template = """
//
// Solved by Tark Wight
//
"""

let fileManager = FileManager.default
let baseURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)

for ext in extensions {
    let langDir = baseURL.appendingPathComponent(ext)
    try? fileManager.createDirectory(at: langDir, withIntermediateDirectories: true)
    
    for name in names {
        let folder = langDir.appendingPathComponent(name)
        try? fileManager.createDirectory(at: folder, withIntermediateDirectories: true)

        let codeFile = folder.appendingPathComponent("\(name).\(ext)")
        if !fileManager.fileExists(atPath: codeFile.path) {
            try? (template + "\n").write(to: codeFile, atomically: true, encoding: .utf8)
            print("The file was created: \(codeFile.path)")
        }

        let readmeFile = folder.appendingPathComponent("README.md")
        if !fileManager.fileExists(atPath: readmeFile.path) {
            try? "\(name)\n".write(to: readmeFile, atomically: true, encoding: .utf8)
            print("README was created: \(readmeFile.path)")
        }
    }
}
