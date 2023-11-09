<div class="section">
    <div class="container">
        <div class="box-radius-logo">
            <div class="text-center">
                @if ($title = $shortcode->title)
                    <p class="font-lg color-brand-1 wow animate__animated animate__fadeInUp">{!! BaseHelper::clean($title) !!}</p>
                @endif
            </div>
            @if (count($tabs) > 0)
                <div class="mt-30">
                    <ul class="list-partners wow animate__animated animate__fadeInUp">
                        @foreach($tabs as $tab)
                            @continue(! $tab['image'])
                            <li>
                                @if ($tab['url'])
                                    <a title="{{ $tab['title'] }}" href="{{ $tab['url'] }}" @if ($tab['is_open_new_tab'] == 'yes') target="_blank" @endif>
                                        <img src="{{ RvMedia::getImageUrl($tab['image']) }}" alt="{{ $tab['title'] }}">
                                    </a>
                                @else
                                    <img src="{{ RvMedia::getImageUrl($tab['image']) }}" alt="{{ $tab['title'] }}">
                                @endif
                            </li>
                        @endforeach
                    </ul>
                </div>
            @endif
        </div>
    </div>
</div>
