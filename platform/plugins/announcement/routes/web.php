<?php

use ArchiElite\Announcement\Http\Controllers\AnnouncementController;
use ArchiElite\Announcement\Http\Controllers\SettingController;
use Illuminate\Support\Facades\Route;
use Botble\Base\Facades\BaseHelper;

Route::middleware(['web', 'core', 'auth'])
    ->prefix(sprintf('%s/announcements', BaseHelper::getAdminPrefix()))
    ->name('announcements.')
    ->group(function () {
        Route::resource('/', AnnouncementController::class)->parameters(['' => 'announcement']);
        Route::get('settings', [SettingController::class, 'index'])->name('settings');
        Route::group(['permission' => 'announcements.settings'], function () {
            Route::post('settings', [SettingController::class, 'update']);
        });
    });
