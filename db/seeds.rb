users = User.create(login: 'ss', password: 'ss')

categogies = Category.create([
  { title: 'Разное' },
  { title: 'Исскуство' },
  { title: 'Спорт' },
  { title: 'Наука' }
])

tests = Test.create([
  { category_id: categogies[0].id, author_id: user[0].id, title: 'Просто тест' },
  { category_id: categogies[0].id, author_id: user[0].id, title: 'Супер тест' },
  { category_id: categogies[0].id, author_id: user[0].id, title: 'Тест' }
])

questions = Question.create([
  { test_id: tests[0].id, body: "Из какого предмета кухонного обихода отлили стойкого оловянного солдатика из сказки Андерсена?" },
  { test_id: tests[0].id, body: "Как называется линия, изображающая процесс, происходящий без теплообмена с окружающей средой?" },
  { test_id: tests[0].id, body: 'Какое изысканное блюдо принесли на обед отбывавшему срок в пятнадцать суток Верзиле в комедии Л.Гайдая "Операция Ы"?' },
  { test_id: tests[0].id, body: "Какой знак восточного гороскопа следует за знаком Дракона?" },
  { test_id: tests[0].id, body: 'Кто ввел в русский алфавит букву "Ё"?' },
  { test_id: tests[0].id, body: "Как звали жену Рембрандта?" }
])

Answer.create([
  { question_id: questions[0].id },
  { question_id: questions[0].id },
  { question_id: questions[0].id },
  { question_id: questions[0].id },
  { question_id: questions[1].id },
  { question_id: questions[1].id }
])
