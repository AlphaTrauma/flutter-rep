/*
 В изначальном коде чтобы добавить новый формат, нужно добавлять новое условие,
 это нарушает OCP. Выносим форматы в отдельные классы, реализующие абстрактный класс ConvertExtension
 без изменения main не обойтись, т.к. классы нужно регистрировать
*/

abstract class ConvertExtension {
    void convert(String filePath);
}

class PdfExtension implements ConvertExtension {
    void convert(String filePath) {
        print("Kонвертируем $filePath в PDF...");
    }
}

class DocxExtension implements ConvertExtension {
    void convert(String filePath) {
        print("Kонвертируем $filePath в DOCX...");
    }
}

class JpgExtension implements ConvertExtension {
    void convert(String filePath) {
        print("Kонвертируем $filePath в JPG...");
    }
}

class FileConverter {
    final Map<String, ConvertExtension> extensions;
  
    FileConverter(this.extensions);
  
    void convert(String fileType, String filePath) {
        final extension = extensions[fileType];
    
        if (extension == null) {
            print("Неизвестный формат файла: $fileType");
            return;
        }
  
      extension.convert(filePath);
    }
}

void main() {
    final converter = FileConverter({
        "pdf": PdfConverter(),
        "docx": DocxConverter(),
        "jpg": JpgConverter(),
    });
  
    converter.convert("pdf", "document.txt");
    converter.convert("docx", "report.txt");
}
