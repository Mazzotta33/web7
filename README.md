# Лабораторная работа 7 — Sign Up

Методичка: `../methodical/Ch7.odt`. Ruby 3.4.11, Rails 8.1.4,
Bundler 4.0.21, SQLite в development/test.

## Запуск

Откройте терминал в папке `web7`:

```powershell
chcp 65001
rails server -p 3007
```

В браузере: **http://localhost:3007/signup**.
Остановка сервера — Ctrl+C. `chcp 65001` включает UTF-8 для кириллицы в пути;
выполняйте один раз в новом терминале.

Если запускаете единственный проект, достаточно `rails server`:
тогда адрес будет http://localhost:3000.

## Подготовка после изменения зависимостей или в новой копии

```powershell
bundle install
rails db:prepare
rails dartsass:build
```

После изменения SCSS повторите `rails dartsass:build` или откройте второй
терминал в папке проекта и запустите `rails dartsass:watch`.

## Остальные команды

```powershell
rails test
rails console
rails dbconsole
rails routes
```

Если терминал открыт до установки Ruby, закройте и откройте его снова,
чтобы обновился PATH. Для ручного запуска `ruby bin/rails` в пути с кириллицей
сначала выполните `chcp 65001`.

Windows запускает Puma и тесты в одном процессе; настройки Linux сохранены.
База проекта: `storage/development.sqlite3`.

## Содержание главы

Регистрация `/signup`, ошибки формы, strong parameters, профиль `/users/:id`,
Gravatar, flash и debug в development. Вход в аккаунт относится к главе 8.
Production настроен на HTTPS, Puma и PostgreSQL; публикация на хостинге
в локальную проверку не входит.
