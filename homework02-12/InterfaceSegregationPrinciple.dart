// В изначальном коде оба класса реализуют все методы, даже если они им не подходят.
// Разделяем интерфейсы и каждый интерфейс делает что-то своё.

abstract class FileOpener {
    void open(String filePath);
}

abstract class TextReadable {
    void readText();
}

abstract class AudioPlayable {
    void playAudio();
}

abstract class FileHandler implements FileOpener, TextReadable, AudioPlayable {

    @override
    void readText() {}
  
    @override
    void playAudio() {}
}

class TextFileHandler extends FileHandler {
    String content = "Пример текста";
  
    @override
    void open(String filePath) {
        print("Открываем текстовый файл: $filePath");
    }
  
    @override
    void readText() {
        print("Читаем текст: $content");
    }
}

class AudioFileHandler extends FileHandler {
    @override
    void open(String filePath) {
        print("Открываем аудиофайл: $filePath");
    }
  
    @override
    void playAudio() {
        print("Воспроизводим аудио...");
    }
}

void main() {
    List<FileHandler> files = [TextFileHandler(), AudioFileHandler()];
  
    for (var file in files) {
        file.open("file.txt");
        file.readText();
        file.playAudio();
    }
}
