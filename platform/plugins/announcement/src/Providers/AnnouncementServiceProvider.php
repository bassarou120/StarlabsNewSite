<?php

namespace ArchiElite\Announcement\Providers;

use ArchiElite\Announcement\Models\Announcement;
use Botble\Base\Facades\DashboardMenu;
use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Illuminate\Foundation\Application;
use Illuminate\Routing\Events\RouteMatched;

class AnnouncementServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/announcement')
            ->loadRoutes()
            ->loadAndPublishConfigurations('permissions')
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadMigrations()
            ->publishAssets();

        $this->app->booted(fn (Application $app) => $app->register(HookServiceProvider::class));

        $this->app['events']->listen(RouteMatched::class, function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-announcement',
                    'priority' => 10,
                    'parent_id' => null,
                    'name' => 'plugins/announcement::announcements.name',
                    'icon' => 'fas fa-bullhorn',
                    'permissions' => ['announcements.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-announcement-list',
                    'parent_id' => 'cms-plugins-announcement',
                    'name' => 'plugins/announcement::announcements.name',
                    'url' => route('announcements.index'),
                    'permissions' => ['announcements.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-announcement-create',
                    'parent_id' => 'cms-plugins-announcement',
                    'name' => 'plugins/announcement::announcements.add_new',
                    'url' => route('announcements.create'),
                    'permissions' => ['announcements.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-announcement-settings',
                    'parent_id' => 'cms-plugins-announcement',
                    'name' => 'plugins/announcement::announcements.settings.name',
                    'url' => route('announcements.settings'),
                    'permissions' => ['announcements.settings'],
                ]);
        });

        if (
            defined('LANGUAGE_MODULE_SCREEN_NAME')
            && defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')
        ) {
            LanguageAdvancedManager::registerModule(Announcement::class, ['content']);
        }
    }
}
