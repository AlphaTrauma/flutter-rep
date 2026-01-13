class Validators {
    static String? email(String? value) {
        if (value == null || value.isEmpty) {
            return 'Введите email';
        }

        if (!value.contains('@')) {
            return 'Email должен включать символ "@"';
        }

        if (!value.contains('.')) {
            return 'Email должен включать точку';
        }

        return null;
    }

    static String? password(String? value) {
        if (value == null || value.isEmpty) {
            return 'Введите пароль';
        }

        if (value.length < 6) {
            return 'Минимум 6 символов';
        }

        return null;
    }
}
