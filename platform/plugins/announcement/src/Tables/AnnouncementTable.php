<?php

namespace ArchiElite\Announcement\Tables;

use ArchiElite\Announcement\Models\Announcement;
use Botble\Base\Facades\Html;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\NameColumn;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Http\JsonResponse;

class AnnouncementTable extends TableAbstract
{
    public function setup(): void
    {
        $this->model(Announcement::class)
            ->addActions([
                EditAction::make()->route('announcements.edit'),
                DeleteAction::make()->route('announcements.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()
                    ->route('announcements.edit')
                    ->alignLeft(),
                Column::make('is_available')
                    ->title(trans('plugins/announcement::announcements.is_available')),
                CreatedAtColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('announcements.destroy'),
            ])
            ->addBulkChanges([
                'name' => [
                    'title' => trans('core/base::tables.name'),
                    'type' => 'text',
                    'validate' => 'required|max:120',
                ],
                'created_at' => [
                    'title' => trans('core/base::tables.created_at'),
                    'type' => 'datePicker',
                ],
            ])
            ->queryUsing(fn (Builder $query) => $query->select('id', 'name', 'is_active', 'created_at'))
            ->onAjax(fn (): JsonResponse => $this->toJson(
                $this
                    ->table
                    ->eloquent($this->query())
                    ->editColumn('is_available', function (Announcement $announcement) {
                        return Html::tag('span', $announcement->is_available ? __('Yes') : __('No'), [
                            'class' => sprintf('badge bg-%s', $announcement->is_available ? 'info' : 'danger'),
                        ]);
                    })
            ));
    }

    public function buttons(): array
    {
        return $this->addCreateButton(route('announcements.create'), 'announcements.create');
    }
}
