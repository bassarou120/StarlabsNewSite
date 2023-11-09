<div class="section mt-35">
    <div class="container">
        <div class="breadcrumbs wow animate__animated animate__fadeIn" data-wow-delay=".0s">
            <ul>
                @foreach (Theme::breadcrumb()->getCrumbs() as $crumb)
                    @if($loop->first)
                        <li>
                            <a href="{{ $crumb['url'] }}">
                                <svg class="w-6 h-6 icon-16" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                                </svg>
                                <span>{{ $crumb['label'] }}</span>
                            </a>
                        </li>
                    @elseif (! $loop->last)
                        <li>
                            <a href="{{ $crumb['url'] }}">{{ $crumb['label'] }}</a>
                        </li>
                    @else
                        <li>{{ $crumb['label'] }}</li>
                    @endif
                @endforeach
            </ul>
        </div>
    </div>
</div>
