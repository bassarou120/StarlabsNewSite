<?php

namespace Botble\BusinessService\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FormAbstract;
use Botble\BusinessService\Http\Requests\ServiceRequest;
use Botble\BusinessService\Models\Service;
use Botble\BusinessService\Models\ServiceCategory;

class ServiceForm extends FormAbstract
{
    public function buildForm(): void
    {
        $this
            ->setupModel(new Service())
            ->setValidatorClass(ServiceRequest::class)
            ->withCustomFields()
            ->add('category_id', 'customSelect', [
                'label' => trans('plugins/business-services::business-services.category'),
                'required' => true,
                'attr' => [
                    'class' => 'select-search-full',
                ],
                'choices' => [null => trans('plugins/business-services::business-services.form.none')] + ServiceCategory::query()
                        ->wherePublished()
                        ->pluck('name', 'id')
                        ->all(),
            ])
            ->add('name', 'text', [
                'label' => trans('core/base::forms.name'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('plugins/business-services::business-services.form.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('description', 'textarea', [
                'label' => trans('core/base::forms.description'),
                'attr' => [
                    'placeholder' => trans('plugins/business-services::business-services.form.description_placeholder'),
                    'data-counter' => 400,
                    'rows' => 3,
                ],
            ])
            ->add('content', 'editor', [
                'label' => trans('core/base::forms.content'),
                'required' => true,
                'attr' => [
                    'rows' => 4,
                    'placeholder' => trans('core/base::forms.description_placeholder'),
                    'with-short-code' => true,
                ],
            ])
            ->add('is_featured', 'onOff', [
                'label' => trans('plugins/business-services::business-services.form.is_featured'),
            ])
            ->add('status', 'customSelect', [
                'label' => trans('core/base::tables.status'),
                'label_attr' => ['class' => 'control-label required'],
                'attr' => [
                    'class' => 'select-search-full',
                ],
                'choices' => BaseStatusEnum::labels(),
            ])
            ->add('image', 'mediaImage')
            ->setBreakFieldPoint('status');
    }
}
