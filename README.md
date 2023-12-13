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

![](https://github.com/Rasslabsya/Gotoheaven/blob/main/assets/tg_image_2186578559.jpeg)

2. Провели те же самые манипуляции, чтобы перенести устройства Б на устройство А (пользуясь терминалом С)

<a name="Лабораторная 1*"></a>
## Лабораторная 1*
```
Сделать аналогичное, но подключаться при помощи публичных и приватных ключей, а не по логину паролю.
```
## Лабораторная №1 со звездочкой : Передача файла с использованием SSH и ключей

### Для начала создаем пары ключей

1. На компьютере A, открываем консоль.

2. Используем команду ssh-keygen для создания пары ключей (публичный и приватный). Выбираем подходящие параметры для ключей. Обычно будет предложено указать местоположение и имя файла для ключей (по надобности указываем).

Команды:
```
bash
ssh-keygen
```

По умолчанию, ключи будут созданы в домашней директории пользователя в подкаталоге .ssh.

### Копируем публичный ключа на компьютер B

1. После успешного создания ключей появился публичный ключ (обычно в файле `id_rsa.pub`). Содержимое этого файла - публичный ключ, который нам нужно скопировать на компьютер B.

2. Используем команду ssh-copy-id для копирования нашего публичного ключа на компьютер B. Заменяем  <пользователь_B> и <IP_адрес_B> на соответствующие значения.

Команды:
```
bash
ssh-copy-id <пользователь_B>@<IP_адрес_B>
```

3. Также нас попросили ввести пароль пользователя B. После успешного ввода пароля, публичный ключ был добавлен в список авторизованных ключей для пользователя на компьютере B.

### Передача файла с использованием ключей

Теперь, после того как публичный ключ добавлен на компьютер B, можно передавать файлы без необходимости вводить пароль. Используем scp для передачи файла, как описано в предыдущей части лабораторной работы, но без указания пароля. Пример:

Команды:
```
bash
scp <путь_к_файлу_на_B> <пользователь_C>@<IP_адрес_С>:<путь_к_целевой_папке_на_С>
```

Теперь процесс передачи файла будет автоматизирован, при этом пароль не будет запрашиваться для каждой операции. Использование ключей предоставляет более безопасный метод доступа к удаленному компьютеру на основе криптографии, не требующий ввода пароля.

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

1) Указание конкретной версии образа ```ubuntu```. Это обеспечивает стабильность и повторяемость сборки.

2) Использование одной ```run``` команды облегчает управление контейнерами, обеспечивает лучшую изоляцию и эффективное использование ресурсов.
   
3) Использование устаревших образов (устаревшие образы могут содержать уязвимости или привести к проблемам совместимости)

4) Интерференция с другими контейнерами (если используется множество контейнеров, нужно удостовериться, что они не конфликтуют между собой по поводу ресурсов, портов и других аспектов)



В данном dockerfile'е мы избежали всех описанных ранее "bad practices".
<p align='center'>
<img width='600px' src="https://github.com/Rasslabsya/Gotoheaven/blob/main/assets/good%20run.png">
</p>

<a name="Лабораторная 3"></a>
## Лабораторная 3
```
Сделать, чтобы после пуша в ваш репозиторий автоматически собирался 
докер образ и результат его сборки сохранялся куда-нибудь. 
(например, если результат - текстовый файлик, он должен 
автоматически сохраниться на локальную машину, в ваш репозиторий или на ваш сервер). 
```
Мы использовали github workflows для автоматической сборки Dockerfile:

Сам Dockerfile содержит в себе базовый образ Ubuntu, а также команду traceroute для проверки работы сайта(аналог ping). Данная команда нужна 
для индикации успешной сборки докера.  

После создания Dockerfile его образ отправляется в публичный репозиторий на DockerHub

Основных команды, которые были использованы:   
```FROM ubuntu``` - берем образ ubuntu   

```RUN``` - устанавливаем и обновляем пакеты

**Выполнение работы:** 

### Создание Workflow файла

В этом файле есть 5 команд:

1) docker build . --file Dockerfile --tag lab3:latest - Создание образа из только что запушеного Dockerfile
2) docker run -d lab3:latest - Запуск Dockerfile для проверки его роботоспособности
3) docker login -u login -p password - Вход в аккаунт DockerHub для отправки собранного образа
4) docker tag lab3 wertolab/lab3:latest - Регистрация собранного образа
5) docker push wertolab/lab3:latest - Отправка образа в репозиторий на DockerHub

<p align='center'>
<img width='600px' src="https://github.com/Rasslabsya/Gotoheaven/blob/main/assets/lab3_workflow_file_screen.png">
</p>

### Создание Dockerfile

<p align='center'>
<img width='600px' src="https://github.com/Rasslabsya/Gotoheaven/blob/main/assets/lab3_Dockerfile_screen.png">
</p>

<a name="АНАЛИТИЧЕСКИЕ ЛАБЫ"></a>
# АНАЛИТИЧЕСКИЕ ЛАБЫ

<a name="Лабораторная №1"></a>
## Лабораторная №1
```
Знакомство с облачными сервисами. Понимание уровней абстракции над инфраструктурой в облаке.
Формирование понимания типов потребления сервисов в сервисной-модели.
Сопоставление сервисов между разными провайдерами.
Оценка возможностей миграции на отечественные сервисы.
```
Шаги выполнения лабораторной работы:
1) Скачали .csv файл, соответствующий нашему варианту, и открыли его в приложении для работы с таблицами (в нашем случае - это приложение "Numbers")


2) Перед тем, как заполнять таблицу, необходимо было ознакомиться с хэдерами:
   
``` IT Tower ``` - Describes the technology functions supported by IT spend in terms and groupings relevant to the owners and consumers of those functions (Описывают технологические функции в терминах и группировках, имеющих отношение к владельцам и потребителям этих функций -> по сути, это группа, которая управляет общей структурой сервиса). Например: Application, Delivery, Data Center, Storage и так далее (информацию взяли из этого ресурса: https://www.apptio.com/platform/atum/)

``` Service Family ``` - Группа сервисов, которые направлены на выполнение одной задачи или решение одной проблемы (мы сделали такой вывод в процессе анализа сервисов, представленных в изначальной таблице для выполнения лабораторной работы - при обзорном просмотре списка сервисов на сайте https://aws.amazon.com/ru/). Примеры возможных групп сервисов: Аналитика, Контейнеры, Базы данных и так далее.

``` Service Type ``` - Тип сервиса из конкретной группы сервисов. Например: Elastic, Kinesis, IoT и так далее.

``` Service Usage Type ``` - Тип использования сервиса, который мы будем извлекать из уже предоставленных данных в изначальной таблице.

3) Проанализировали сервисы, которые были даны в таблице:
   
``` AmazonElastiCache ``` -  полностью управляемый сервис, совместимый с Redis и Memcached и обеспечивающий оптимизированную по затратам производительность современных приложений в режиме реального времени. 

``` AmazonES ``` - база сервиса "Amazon OpenSearch Service", который  упрощает интерактивный анализ журналов, мониторинг приложений в режиме реального времени, поиск на веб-сайтах и многие другие процессы. В сервис Amazon OpenSearch включены последние версии OpenSearch, поддержка 19 версий Elasticsearch (версии от 1.5 до 7.10) и возможности визуализации на базе OpenSearch Dashboards и Kibana (версии от 1.5 до 7.10).

``` AmazonQLDB ``` - это полностью управляемая база данных реестров, обеспечивающая прозрачный, неизменяемый и проверяемый криптографическими методами журнал транзакций.

``` awskms ``` - сервис для управления ключами AWS (AWS KMS), с помощью которого можно создавать и контролировать криптографические ключи для приложений и сервисов AWS, а также управлять ими.

``` CloudHSM ``` - сервис, который помогает соблюдать корпоративные, договорные и нормативные требования к обеспечению безопасности данных.

``` AmazonRekognition ``` - сервис, который  предлагает возможности предварительно обученного и настраиваемого машинного зрения (CV), которое позволяет получать полезную информацию из ваших изображений и видеозаписей.

``` AmazonTextract ``` - сервис машинного обучения, который автоматически извлекает печатный и рукописный текст, элементы макета и данные из сканированных документов.

``` AmazonLex ``` - это полностью управляемый сервис искусственного интеллекта с расширенными моделями естественного языка для проектирования, встраивания, тестирования и развертывания речевых интерфейсов в приложениях.

``` AWSCodePipeline ``` -  это полностью управляемый сервис непрерывной доставки, который помогает автоматизировать работу конвейеров выпуска для быстрого и надежного обновления приложений и инфраструктуры.

``` AmazonSES ``` - сервис, который позволяет конфиденциально общаться с клиентами без локального почтового сервера Simple Mail Transfer Protocol (SMTP), используя Amazon SES API или интерфейс SMTP.

``` AmazonSNS ``` -  сервис уведомлений, который использует два метода отправки сообщений: A2A и A2P. A2A обеспечивает высокую пропускную способность для обмена push-уведомлениями между распределенными системами, микросервисами и бессерверными приложениями на основе событий по модели «многие ко многим». 

4) Заполнили таблицу:

<img width="519" alt="Снимок экрана 2023-12-13 в 3 29 36 PM" src="https://github.com/Rasslabsya/Gotoheaven/assets/112973565/5d139b13-6d41-4946-a17c-e10db1b4ab6c">

5) Провели анализ в соответствии с сервисами Yandex.Cloud:
   
``` AmazonElastiCache ``` -  Yandex Managed Service for Redis

``` AmazonES ``` - Yandex Managed Service for Elasticsearch

``` AmazonQLDB ``` - Аналог Yandex.Cloud отсутствует :(

``` awskms ``` - Yandex Key Management Service

``` CloudHSM ``` - Аналог Yandex.Cloud отсутствует :(

``` AmazonRekognition ``` - Yandex Vision

``` AmazonTextract ``` - Yandex Vision

``` AmazonLex ``` - Yandex SpeechSense

``` AWSCodePipeline ``` -  Аналог Yandex.Cloud отсутствует :(

``` AmazonSES ``` - Yandex Postbox

``` AmazonSNS ``` -  Аналог Yandex.Cloud отсутствует :(

Задаваясь вопросом о полном переходе на сервисы российского аналога, ответ дать затруднительно, но мы бы сказали, что "скорее нет", так как  не все сервисы имеют аналог в Yandex Cloud.



