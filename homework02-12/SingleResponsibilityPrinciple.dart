// Изначальный код нарушает принцип единственной ответственности, т.к. один класс сочетает в себе различные функции:
// валидация, преобразование, сохранение и логирование. Выносим в разные классы

class UserValidator {
    void validate(Map<String, dynamic> userData) {
        if (userData['name'] == null || userData['name'].isEmpty) {
            throw Exception('Имя пользователя не может быть пустым');
        }
    
        if (userData['age'] == null || userData['age'] < 0) {
            throw Exception('Возраст пользователя не может быть отрицательным');
        }
    }
}

class UserTransformer {
    Map<String, dynamic> transform(Map<String, dynamic> userData) {
        userData['name'] = userData['name'].toString().toUpperCase();
        userData['age'] = userData['age'] + 1;
        return userData;
    }
}

class UserRepository {
    void save(Map<String, dynamic> userData) {
        print('Данные сохранены: $userData');
    }
}

class UserLogger {
    void info(String message) {
        print(message);
    }
}

class UserManager {
    final UserValidator validator = UserValidator();
    final UserTransformer transformer = UserTransformer();
    final UserRepository repository = UserRepository();
    final UserLogger logger = UserLogger();
  
    void processUserData(Map<String, dynamic> userData) {
        validator.validate(userData);
        final transformed = transformer.transform(userData);
        repository.save(transformed);
        logger.info('Данные пользователя успешно обработаны и сохранены');
    }
}

void main() {
    final userManager = UserManager();
    userManager.processUserData({'name': 'Alice', 'age': 25});
}