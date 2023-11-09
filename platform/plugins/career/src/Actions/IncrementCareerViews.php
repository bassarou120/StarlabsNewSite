<?php

namespace ArchiElite\Career\Actions;

use ArchiElite\Career\Models\Career;
use Botble\Base\Supports\Helper;

class IncrementCareerViews
{
    public function __invoke(Career $career): void
    {
        Helper::handleViewCount($career, 'career_viewed');
    }
}
