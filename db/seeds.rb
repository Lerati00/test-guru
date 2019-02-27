User.create(login: 'ss', password: 'ss')

Category.create([
  { title: 'Разное' },
  { title: 'Исскуство' },
  { title: 'Спорт' },
  { title: 'Наука' }
])

Test.create([
  { category_id: 1, title: 'Просто тест' },
  { category_id: 1, title: 'Супер тест' },
  { category_id: 1, title: 'Тест' }
])

Question.create([
  { test_id: 1, body: "Из какого предмета кухонного обихода отлили стойкого оловянного солдатика из сказки Андерсена?" },
  { test_id: 1, body: "Как называется линия, изображающая процесс, происходящий без теплообмена с окружающей средой?" },
  { test_id: 1, body: 'Какое изысканное блюдо принесли на обед отбывавшему срок в пятнадцать суток Верзиле в комедии Л.Гайдая "Операция Ы"?' },
  { test_id: 1, body: "Какой знак восточного гороскопа следует за знаком Дракона?" },
  { test_id: 1, body: 'Кто ввел в русский алфавит букву "Ё"?' },
  { test_id: 1, body: "Как звали жену Рембрандта?" }
])

Answer.create([
  { question_id: 1 },
  { question_id: 1 },
  { question_id: 3 },
  { question_id: 4 },
  { question_id: 5 },
  { question_id: 6 }
])
