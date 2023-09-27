# Gotoheaven
![](https://github.com/Rasslabsya/Gotoheaven/blob/main/assets/ezgif.com-add-text.jpg)

<div align="center">

  <h3>Лабораторные работы команды "Идущие к облакам"</h3>
  <h4>по дисциплине: "Облачные технологии и услуги"</h4>

```
    Состав команды:
    
    Леманов Андрей
    Гринин Александр
    Чебан Илья
    Отрощенко Валерия
```

</div>


<details>
  <summary> Навигация </summary>
  <ol>
    <li>
      <a href="#DEVOPS ЛАБЫ">DEVOPS ЛАБЫ</a>
      <ul>
        <li><a href="#Лабораторная №1">Лабораторная №1</a></li>
        <li><a href="#Лабораторная №2">Лабораторная №2</a></li>
      </ul>
    </li>
  </ol>
</details>


<a name="DEVOPS ЛАБЫ"></a>
# DEVOPS ЛАБЫ

<a name="Лабораторная №1"></a>
## Лабораторная 1

```
Пользуясь терминалом на компьютере А перенести файл с компьютера Б на компьютер С,
находящиеся в одной локальной сети.

Понадобится ssh. Просьба использовать MacOS/Linux/WSL.
```

Перед началом выполнения лабораторной работы был освоен **теоретический аспект**, обязательный для успешного выполнения этой работы.

Для выполнения лабораторной работы была необходима утилита **scp (Secure CoPy)**, которая позволяет безопасно копировать данные между системами Linux с использованием протокола SSH. Эта утилита включена в состав OpenSSH, поэтому нет необходимости устанавливать дополнительное программное обеспечение для её использования.

---

1. Убедились, что SSH сервер запущен и настроен (на некоторых ноутбуках пришлось настроить, изменив настройки общего доступа - MacOS).
2. Применили команду **scp**, чтобы перенести скопировать файл с одного компьютера, а затем перенести на другой. Пример команды выглядит следующим образом:
   
   ```
      scp путь/к/файлу/на/компьютере/Б имя_пользователя@IP_компьютера_Б:/путь/назначения/на/компьютере/С
   ```
В данном случае файл переносится с устройста Б на устройство С (с помощью устройства А)

---

**Выполнение работы:**

Нам понадобятся логины пользователей, их пароли, а тажке IP. Первые две характеристики известны владельцу каждого устройста, IP мы нашли, используя следующие команды: **_ifconfig | grep "inet " | grep -v 127.0.0.1_** или **_ifconfig_**

1. Для начала мы создали на рабочем столе компьютера Б текстовый файл и убедились, что соединение выполняется успешно. Затем с устройста Б перенесли текстовый файл на устройство С (пользуясь терминалом компьютера А):

2. Провели те же самые манипуляции, чтобы перенести устройства Б на устройство А (пользуясь терминалом С)

<a name="Лабораторная 2"></a>
## Лабораторная 2
```
Написать два Dockerfile – плохой и хороший. Плохой должен запускаться и работать корректно, но
в нём должно быть не менее 3 “bad practices”. В хорошем Dockerfile они должны быть исправлены.
В Readme описать все плохие практики из кода Dockerfile и почему они плохие, как они были исправлены
в хорошем  Dockerfile, а также две плохие практики по использованию этого контейнера.
```
Мы решили обернуть в docker-контейнер образ Ubuntu:

Плохой dockerfile (https://hub.docker.com/repository/docker/wertolab/project_bad/general)

Хороший dockerfile (https://hub.docker.com/repository/docker/wertolab/project_good/general)

Часть основных команд, которые были использованы:   
```FROM ubuntu``` - берем образ питона   

```RUN``` - устанавливаем и обновляем пакеты

```COPY``` - копируем файлы с компьютера, который запускает сборку внутрь образа

**Выполнение работы:**     

### Плохой Dockerfile

1)  Использование образа ```ubuntu:latest``` без указания версии - это может привести к неожиданным изменениям в базовом образе при обновлениях. Вместо этого лучше использовать конкретную версию образа.
<p align='center'>
<img width='600px' src="https://github.com/Rasslabsya/Gotoheaven/blob/main/assets/bad%20latest.png">
</p>

2)  Множественные ```run``` - это может увеличить размер образа и сделать его менее эффективным. Нужно объединять команды в одну строку и использовать многозадачные команды, если это возможно.
<p align='center'>
<img width='600px' src="https://github.com/Rasslabsya/Gotoheaven/blob/main/assets/bad%20run'.png">
</p>

3) Использование ```add``` - ```add``` может автоматически распаковывать архивы и загружать файлы из URL, что может быть опасно. Вместо ADD лучше использовать COPY, если вам нужно копировать локальные файлы.
<p align='center'>
<img width='600px' src="https://github.com/Rasslabsya/Gotoheaven/blob/main/assets/Снимок%20экрана%202023-09-28%20в%201.01.25%20AM.png">
</p>

### Хороший Dockerfile

В данном dockerfile'е мы избежали всех описанных ранее "bad practices".
<p align='center'>
<img width='600px' src="https://github.com/Rasslabsya/Gotoheaven/blob/main/assets/good%20run.png">
</p>




