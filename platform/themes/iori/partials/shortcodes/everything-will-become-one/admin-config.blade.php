<section>
    <div class="form-group">
        <label class="control-label">{{ __('Title') }}</label>
        <input name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" />
    </div>

    <div class="form-group">
        <label class="control-label">{{ __('Subtitle') }}</label>
        <input name="subtitle" value="{{ Arr::get($attributes, 'subtitle') }}" class="form-control" />
    </div>

    <div class="form-group">
        <label class="control-label">{{ __('Image') }}</label>
        {!! Form::mediaImage('image', Arr::get($attributes, 'image')) !!}
    </div>

    <div class="mb-3">
        {!! Shortcode::fields()->tabs([
            'title' => [
                'title' => __('Title'),
                'type' => 'text',
            ],
            'image' => [
                'title' => __('Image'),
                'type' => 'image',
            ],
            'description' => [
                'title' => __('Description'),
                'type' => 'textarea',
            ],
        ], $attributes) !!}
    </div>
</section>
