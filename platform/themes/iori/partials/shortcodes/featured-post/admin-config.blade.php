<section>
    <div class="form-group">
        <label class="control-label">{{ __('Title') }}</label>
        <input name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" />
    </div>

    <div class="form-group">
        <label class="control-label">{{ __('Choose categories') }}</label>
        {!! Shortcode::fields()->ids('category_ids', $attributes, $categories) !!}
    </div>
</section>
