<?php

namespace ArchiElite\Career\Tables;

use ArchiElite\Career\Models\Career;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\StatusColumn;
use Illuminate\Contracts\Database\Eloquent\Builder;

class CareerTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Career::class)
            ->addActions([
                EditAction::make()->route('careers.edit'),
                DeleteAction::make()->route('careers.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('careers.edit')->alignLeft(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('careers.destroy'),
            ])
            ->addBulkChanges([
                'name' => [
                    'title' => trans('core/base::tables.name'),
                    'type' => 'text',
                    'validate' => 'required|max:120',
                ],
                'status' => [
                    'title' => trans('core/base::tables.status'),
                    'type' => 'select',
                    'choices' => BaseStatusEnum::labels(),
                    'validate' => 'required|in:' . implode(',', BaseStatusEnum::values()),
                ],
                'created_at' => [
                    'title' => trans('core/base::tables.created_at'),
                    'type' => 'datePicker',
                ],
            ])
            ->queryUsing(function (Builder $query) {
                $query->select([
                    'id',
                    'name',
                    'created_at',
                    'status',
                ]);
            });
    }

    public function buttons(): array
    {
        return $this->addCreateButton(route('careers.create'), 'careers.create');
    }
}
