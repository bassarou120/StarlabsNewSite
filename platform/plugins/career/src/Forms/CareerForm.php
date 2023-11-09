<?php

namespace ArchiElite\Career\Forms;

use ArchiElite\Career\Http\Requests\CareerRequest;
use ArchiElite\Career\Models\Career;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FormAbstract;

class CareerForm extends FormAbstract
{
    public function buildForm(): void
    {
        $this
            ->setupModel(new Career())
            ->setValidatorClass(CareerRequest::class)
            ->withCustomFields()
            ->add('name', 'text', [
                'label' => trans('core/base::forms.name'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('location', 'text', [
                'label' => trans('plugins/career::career.location'),
                'required' => true,
                'attr' => [
                    'data-counter' => 120,
                ],
            ])
            ->add('salary', 'text', [
                'label' => trans('plugins/career::career.salary'),
                'required' => true,
                'attr' => [
                    'data-counter' => 120,
                ],
            ])
            ->add('description', 'textarea', [
                'label' => trans('core/base::forms.description'),
                'attr' => [
                    'rows' => 4,
                    'placeholder' => trans('core/base::forms.description_placeholder'),
                    'data-counter' => 400,
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
            ->add('status', 'customSelect', [
                'label' => trans('core/base::tables.status'),
                'label_attr' => ['class' => 'control-label required'],
                'attr' => [
                    'class' => 'form-control select-full',
                ],
                'choices' => BaseStatusEnum::labels(),
            ])
            ->setBreakFieldPoint('status');
    }
}
