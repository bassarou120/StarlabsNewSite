<?php

namespace ArchiElite\Announcement\Forms;

use ArchiElite\Announcement\Http\Requests\AnnouncementRequest;
use ArchiElite\Announcement\Models\Announcement;
use Botble\Base\Facades\Assets;
use Botble\Base\Forms\FormAbstract;

class AnnouncementForm extends FormAbstract
{
    public function buildForm(): void
    {
        Assets::addScriptsDirectly('vendor/core/plugins/announcement/js/announcement.js');

        $this
            ->setupModel(new Announcement())
            ->setValidatorClass(AnnouncementRequest::class)
            ->withCustomFields()
            ->add('name', 'text', [
                'label' => trans('core/base::forms.name'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 255,
                ],
            ])
            ->add('content', 'editor', [
                'label' => trans('core/base::forms.content'),
                'required' => true,
                'attr' => [
                    'rows' => 2,
                    'without-buttons' => true,
                ],
            ])
            ->add('openRow1', 'html', [
                'html' => '<div class="row">',
            ])
            ->add('start_date', 'datetime-local', [
                'label' => trans('plugins/announcement::announcements.start_date'),
                'wrapper' => [
                    'class' => 'col-md-6 mb-3',
                ],
            ])
            ->add('end_date', 'datetime-local', [
                'label' => trans('plugins/announcement::announcements.end_date'),
                'wrapper' => [
                    'class' => 'col-md-6 mb-3',
                ],
            ])
            ->add('closeRow1', 'html', [
                'html' => '</div>',
            ])
            ->add('has_action', 'onOff', [
                'label' => trans('plugins/announcement::announcements.has_action'),
            ])
            ->add('openRow2', 'html', [
                'html' => '<div class="row has-action" style="display: none;">',
            ])
            ->add('action_label', 'text', [
                'label' => trans('plugins/announcement::announcements.action_label'),
                'wrapper' => [
                    'class' => 'col-md-4 mb-3',
                ],
            ])
            ->add('action_url', 'text', [
                'label' => trans('plugins/announcement::announcements.action_url'),
                'wrapper' => [
                    'class' => 'col-md-4 mb-3',
                ],
            ])
            ->add('action_open_new_tab', 'onOff', [
                'label' => trans('plugins/announcement::announcements.action_open_new_tab'),
                'wrapper' => [
                    'class' => 'col-md-4 mb-3',
                ],
            ])
            ->add('closeRow2', 'html', [
                'html' => '</div>',
            ])
            ->add('is_active', 'onOff', [
                'label' => trans('plugins/announcement::announcements.is_active'),
                'label_attr' => ['class' => 'control-label'],
                'default_value' => true,
            ])
            ->setBreakFieldPoint('is_active');
    }
}
