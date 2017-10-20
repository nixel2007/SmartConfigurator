Перем Обмен;

Процедура ПолучитьСписокФайлов(Знач РабочийКаталог, СписокФайлов)

	МассивДопустимыхРасширений = Новый Массив;
	МассивДопустимыхРасширений.Добавить(".epf");
	МассивДопустимыхРасширений.Добавить(".erf");
	МассивДопустимыхРасширений.Добавить(".cf");

	Каталоги = НайтиФайлы(РабочийКаталог, "*.*", Истина);
	Для Каждого НайденныйФайл Из Каталоги Цикл
		Если МассивДопустимыхРасширений.Найти(НайденныйФайл.Расширение) <> Неопределено  Тогда
			СписокФайлов = СписокФайлов + НайденныйФайл.ПолноеИмя + Символы.ПС;
		КонецЕсли;
	КонецЦикла;

КонецПроцедуры

Процедура ПриСозданииОбъекта()

	Обмен = ЗагрузитьСценарий("scripts\Обмен.os");
	Приемник = "tmp\module.txt";

	Настройки = ЗагрузитьСценарий("settings\СписокКаталоговВнешнихФорм.os").Настройки;

	Если Настройки.Количество() = 0 Тогда
		Обмен.ПоказатьПредупреждение("Необходимо указать пути внешних отчетов/обработок: settings/СписокКаталоговВнешнихФорм.os", "Внешние файлы");
		Обмен.ЗаписатьРезультатВФайл(Приемник, "");
		Возврат;
	КонецЕсли;

	СписокФайлов = "";

	Для каждого Путь Из Настройки Цикл
		ПолучитьСписокФайлов(Путь, СписокФайлов);
	КонецЦикла;

	Результат = Обмен.ВыбратьИзСписка(СписокФайлов);
	
	Обмен.ЗаписатьРезультатВФайл(Приемник,Результат);

КонецПроцедуры