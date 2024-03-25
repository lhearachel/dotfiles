return {
    {
        '3rd/image.nvim',
        opts = {
            backend = 'kitty',
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = true,
                    only_render_image_at_cursor = true,
                    filetypes = {
                        'markdown'
                    },
                }
            },

            max_width = nil,
            max_height = nil,
            max_with_window_percentage = nil,
            max_height_window_percentage = 50,

            editor_only_render_when_focused = false,
            tmux_show_only_in_active_window = false,

            hijack_file_patterns = {
                '*.png',
                '*.jpg',
                '*.jpeg',
                '*.gif',
                '*.webp',
            }
        }
    }
}
