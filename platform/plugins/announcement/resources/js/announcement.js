'use strict'

$(document).ready(() => {
    const $form = $('#archi-elite-announcement-forms-announcement-form')

    const handleToggleAction = (state) => {
        const $actionGroup = $form.find('.has-action')
        state ? $actionGroup.slideDown() : $actionGroup.slideUp()
    }

    $form.on('change', 'input[name="has_action"]', (e) => {
        handleToggleAction($(e.currentTarget).is(':checked'))
    })

    handleToggleAction($form.find('input[name="has_action"]').is(':checked'))
})
