<?php

namespace ArchiElite\Announcement\Providers;

use ArchiElite\Announcement\Models\Announcement;
use Botble\Base\Supports\ServiceProvider;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Cookie;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! defined('THEME_FRONT_BODY')) {
            return;
        }

        Theme::asset()
            ->add('announcement-css', asset('vendor/core/plugins/announcement/css/announcement.css'));
        Theme::asset()
            ->container('footer')
            ->add('announcement-js', asset('vendor/core/plugins/announcement/js/front.js'));

        $dismissedAnnouncements = json_decode(Cookie::get('ae-anno-dismissed-announcements', '[]'), true);
        $dismissedAnnouncements = Arr::flatten($dismissedAnnouncements);

        add_filter(THEME_FRONT_BODY, function (string|null $html) use ($dismissedAnnouncements): string|null {
            $announcements = Announcement::query()
                ->whereNotIn('id', $dismissedAnnouncements)
                ->available()
                ->inRandomOrder()
                ->get();

            if ($announcements->isEmpty()) {
                return $html;
            }

            $html .= view('plugins/announcement::announcements', compact('announcements'));

            return $html;
        });
    }
}
