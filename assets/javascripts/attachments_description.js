$(document).ready(function() {
    // Вешаем обработчик на таблицу
    $('.attachments').on('click', 'td:nth-child(2)', function() {
        $(this).toggleClass('expanded');

        // Динамически обновляем текст кнопки
        const $button = $(this).find('.toggle-text');
        $button.text($button.text() === 'Показать все' ? 'Скрыть' : 'Показать все');
    });

    // Вставляем кнопки в существующие ячейки
    $('.attachments td:nth-child(2)').each(function(el) {
        if ($(this).text().length > 50) {
            console.log('length', $(this).text().length);
            $(this).append('<span class="toggle-text">Показать все</span>');
        }
    });
});