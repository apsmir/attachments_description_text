$(document).ready(function() {
    // Вешаем обработчик на таблицу
    $('.attachments').on('click', 'td:nth-child(2)', function() {
        $(this).toggleClass('expanded');

        // Динамически обновляем текст кнопки
        const $button = $(this).find('.toggle-text');
        const showAllText = $button.data('show-text');
        const hideText = $button.data('hide-text');
        $button.text($button.text() === showAllText ? hideText : showAllText);
    });

    // Вставляем кнопки в существующие ячейки
    $('.attachments td:nth-child(2)').each(function(el) {
        if ($(this).text().length > 50) {
            const $span = $('<span>', {
                'class': 'toggle-text',
                'data-show-text': ATTACHMENT_TEXTS.show_all,
                'data-hide-text': ATTACHMENT_TEXTS.hide,
                text: ATTACHMENT_TEXTS.show_all
            });
          $(this).append($span);
        }
    });
});