
/* 
 FileConverter напрямую зависит от PdfConferter и DocxConverter,
 а значит, при добавлении новых типов придётся менять и его, что нарушает принцип DIP
 выносим абстракцию наверх, и теперь передаём FileConverter отдельные интерфейсы.
 по уму бы выносить интерфейсы и из FileConverter тоже, но тогда методы convertToPdf и convertToDocx в main 
 нужно заменять, а это уже изменение в api, а не просто внутренний рефакторинг.
*/

abstract class Converter {
    void convert(String filePath);
}

class PdfConverter implements Converter {
    void convert(String filePath) {
        print("Kонвертация $filePath в PDF...");
    }
}

class DocxConverter implements Converter {
    void convert(String filePath) {
        print("Kонвертация $filePath в DOCX...");
    }
}

class FileConverter {
    final Converter pdf;
    final Converter docx;

    FileConverter(this.pdf, this.docx);

    void convertToPdf(String filePath) {
        pdf.convert(filePath);
    }

    void convertToDocx(String filePath) {
        docx.convert(filePath);
    }
}

void main() {
    FileConverter fileConverter = FileConverter(
        PdfConverter(),
        DocxConverter()
    );

    fileConverter.convertToPdf("document.txt");
    fileConverter.convertToDocx("document.txt");
}
