<?php

namespace ArchiElite\Announcement;

use ArchiElite\Announcement\Enums\AnnouncePlacement;
use ArchiElite\Announcement\Enums\TextAlignment;

class AnnouncementHelper
{
    public static function isBottomPlacement(): bool
    {
        return setting('announcement_placement', AnnouncePlacement::TOP) === AnnouncePlacement::BOTTOM;
    }

    public static function getMaxWidth(): string
    {
        $maxWidth = setting('announcement_max_width', '1200');
        $unit = setting('announcement_max_width_unit', 'px');

        return $maxWidth . $unit;
    }

    public static function getFontSize(): string
    {
        $fontSize = setting('announcement_font_size', '0.9');
        $unit = setting('announcement_font_size_unit', 'rem');

        return $fontSize . $unit;
    }

    public static function getTextAlignment(): string
    {
        return setting('announcement_text_alignment', TextAlignment::CENTER);
    }
}
