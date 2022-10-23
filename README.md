# Архитектура вычислительных систем - ИДЗ 1
# Завьялов Егор БПИ-217

## Структура:
[Ассемблерный код без модификаций](asm)

[Ассемблерный код с модификациями](asm_mod)

[Код на Си](c-source)

[Тесты](tests)



## Компиляция кода на Си:
```
gcc main.c -c -o main.o
gcc logic.c -c -o logic.o
gcc main.o task.o -o out
```
## Компиляция кода на Ассемблере:
```
gcc main.s -c -o main.o
gcc logic.s -c -o logic.o
gcc main.o task.o -o out
```
## Запуск:
```
gcc ./out
n(количество элементов)
k1 k2 k3 ... kn
```
или
```
gcc ./out n
```
для ввода через input.txt

## Запуск тестов:
```
gcc <executable> < test1.in // Далее результат руками сравнивается с содержанием файла test1.out
// test2.in также доступен
```
# Отчёт

[Код на Си](c-source) - 2 единицы компиляции

Макросы в [ассемблерном коде](asm) убраны с помощью аргументов командной строки:
```
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./code.c \
    -S -o ./code.s
```
Код на ассемблере отдельно скомпилирован и проходит тесты:
![Снимок экрана от 2022-10-23 20-40-04](https://user-images.githubusercontent.com/76088544/197407274-021ac692-a29f-48ba-807c-8a62044c8e36.png)
![Снимок экрана от 2022-10-23 20-39-55](https://user-images.githubusercontent.com/76088544/197407293-1b8aabf4-b768-47b7-8c4b-bd44188e12ef.png)
<br>
![Снимок экрана от 2022-10-23 20-40-27](https://user-images.githubusercontent.com/76088544/197407297-ec6192e4-f3fc-4746-b064-0f0a877e04ce.png)
![Снимок экрана от 2022-10-23 20-40-37](https://user-images.githubusercontent.com/76088544/197407300-abf78410-5a68-4159-92c8-31c0267661b9.png)

Ввод через аргументы командной строки реализован
Локальные переменные использованы
Комментарии в [ассемблерный код](asm) добавлены 

## Рефакторинг


