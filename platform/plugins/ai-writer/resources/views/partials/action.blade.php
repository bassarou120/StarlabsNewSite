@php
    $spinTemplate = json_decode(setting('ai_writer_spin_template'), true);
@endphp

<div class="d-inline-block editor-action-item">
    <button
        class="btn btn-info btn-ai-writer btn-ai-writer-generate"
        type="button"
    >
        <i class="fas fa-robot me-1"></i>
        {{ trans('plugins/ai-writer::ai-writer.generate') }}
    </button>
    @empty(!$spinTemplate)
        <button
            class="btn btn-primary btn-ai-writer btn-ai-writer-spin"
            type="button"
        >{{ trans('plugins/ai-writer::ai-writer.spin') }}</button>
    @endempty
</div>

@pushonce('footer')
    <div
        class="modal fade"
        id="ai-writer-modal"
        data-backdrop="static"
        data-keyboard="false"
        role="dialog"
        tabindex="-1"
    >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-info">
                    <h4 class="modal-title">
                        <i class="til_img"></i>
                        <strong>{{ trans('plugins/ai-writer::ai-writer.form.title') }}</strong>
                    </h4>
                    <button
                        class="btn-close"
                        data-bs-dismiss="modal"
                        type="button"
                        aria-hidden="true"
                    ></button>
                </div>

                <div class="modal-body with-padding">
                    @include('plugins/ai-writer::generate-content')
                </div>

                <div class="modal-footer">
                    <button
                        class="float-start btn btn-warning"
                        data-bs-dismiss="modal"
                        type="button"
                    >{{ trans('core/base::tables.cancel') }}</button>
                    <button
                        class="float-end btn btn-info"
                        id="generate-content"
                        data-generate-url="{{ route('ai-writer.generate') }}"
                        type="button"
                        href=""
                    >{{ trans('plugins/ai-writer::ai-writer.form.generate') }}</button>
                    <button
                        class="float-end btn btn-success"
                        id="push-content-to-target"
                        data-copied-text="{{ trans('plugins/ai-writer::ai-writer.form.copied') }}"
                        type="button"
                        href=""
                    >{{ trans('plugins/ai-writer::ai-writer.form.push') }}</button>
                </div>
            </div>
        </div>
    </div>

    @empty(!$spinTemplate)
        <div
            class="modal fade"
            id="ai-writer-spin-modal"
            data-backdrop="static"
            data-keyboard="false"
            role="dialog"
            tabindex="-1"
        >
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header bg-info">
                        <h4 class="modal-title">
                            <i class="til_img"></i>
                            <strong>{{ trans('plugins/ai-writer::ai-writer.form.title') }}</strong>
                        </h4>
                        <button
                            class="btn-close"
                            data-bs-dismiss="modal"
                            type="button"
                            aria-hidden="true"
                        ></button>
                    </div>

                    <div class="modal-body with-padding">
                        @include('plugins/ai-writer::spin-content')
                    </div>

                    <div class="modal-footer">
                        <button
                            class="float-start btn btn-warning"
                            data-bs-dismiss="modal"
                            type="button"
                        >{{ trans('core/base::tables.cancel') }}</button>
                        <a
                            class="float-end btn btn-info"
                            id="spin-content"
                            href=""
                        >{{ trans('plugins/ai-writer::ai-writer.form.spin') }}</a>
                        <a
                            class="float-end btn btn-success"
                            id="push-spin-content-to-target"
                            data-copied-text="{{ trans('plugins/ai-writer::ai-writer.form.copied') }}"
                            href=""
                        >{{ trans('plugins/ai-writer::ai-writer.form.push') }}</a>
                    </div>
                </div>
            </div>
        </div>
    @endempty
@endpushonce
