<section>
    <div class="form-group">
        <label class="control-label">{{ __('Title') }}</label>
        <input name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" />
    </div>

    {!! Shortcode::fields()->tabs([
        'title' => [
            'title' => __('Title'),
        ],
        'free' => [
            'title' => __('Free'),
        ],
        'standard' => [
            'title' => __('Standard')
        ],
        'business' => [
            'title' => __('Business')
        ],
        'enterprise' => [
            'title' => __('Enterprise')
        ],
    ], $attributes) !!}
</section>
