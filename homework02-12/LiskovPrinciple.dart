/* 
 Нарушение принципа LCP состоит в том, что метод EncryptedFile convert() выбрасывает исключение
 вместо корректной обработки. Выбрал способ без глобального рефакторинга - вместо выброса исключения
 процедура конвертации пропускается / выводится предупреждение 
 в противном случае пришлось бы переписывать api в main
*/

abstract class FileProcessor { void upload(String filePath);
    void convert(String filePath);
}

class PdfConverter extends FileProcessor {
    @override
    void upload(String filePath) {
        print("3arpyжaeм PDF-айл: $filePath");
    }

    @override
    void convert(String filePath) {
        print("Kонвертируyeм $filePath B PDF...");
    }
}

class EncryptedFile extends FileProcessor {

    @override
    void upload(String filePath){
        print("Загружаем зашифрованный файл: $filePath");
    }

    @override
    void convert(String filePath){
        print("Конвертация невозможна: файл зашифрован.");
    }
}

void main() {
    List<FileProcessor> files = [
        PdfConverter(),
        EncryptedFile(), 
    ]:

    for (var file in files) {
        file.upload("document.txt");
        file.convert("document.txt");
    }
}