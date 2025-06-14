# kototinder1

Приложение напоминающее Tinder с возможностью оценивать ("свайпать") котиков и смотреть информации о них.

# Реализованные "фичи":

- Приложение имеет свою кастомную иконку;
- Приложение показывает случайного котика с названием породы;
- Котика можно свайпнуть влево\вправо для лайка\дизлайка соответственно (или нажать на соответствующие кнопки под картинкой);
- После любого из действий котик обновляется;
- Анимация свайпа карточки котика в виде вращения;
- В случае лайка выполняется обновление со своей анимацией счетчика лайков в AppBar;
- При нажатии на фотографию котика на главном экране открывается подробная информация про породу котика с той же фотографией, местом происхождения, сроком жизни, темпераментом и описанием;
- Имеется обработка ошибок сети;
- Реализован индикатор загрузки.

# Выполненные функциональные требования:

- Главный экран с случайным котиком и названием породы
- Возможность свайпа карточки влево/вправо
- Кнопки лайк/дизлайк
- Смена котика при любом действии
- Счетчик лайков увеличивается при свайпе вправо или нажатии кнопки
- Детальный экран при нажатии на изображение
- Полная информация о породе на детальном экране

# Техническая реализация

assets/icons/

├── cat_paw.png

lib/

├── main.dart

├── app.dart

├── models/

│   └── cat_model.dart

├── repositories/

│   └── cat_repository.dart

├── widgets/

│   ├── reaction_button.dart

│   └── cat_swipe_animation.dart

└── screens/

   ├── cat_explorer_screen.dart
    
   └── cat_details_screen.dart

# Ссылка на скачивание актуальной версии APK:

- https://drive.google.com/file/d/1W3lpE4ZSVXSo4xJA4dwsoOBfr2eyCNq-/view?usp=drive_link

# Скриншоты приложения

## Иконка приложения
 
![2025-06-04 (2)](https://github.com/user-attachments/assets/8e349be1-1dbe-4c8e-a011-b5f89feeac5a)

## Главный экран
 
![2025-06-04 (3)](https://github.com/user-attachments/assets/206ad8ee-3903-4951-968d-156ede6e672f)

## Экран описания
 
![2025-06-04 (5)](https://github.com/user-attachments/assets/a2952d21-5e9f-499b-bffe-0c19e50cc46e)
