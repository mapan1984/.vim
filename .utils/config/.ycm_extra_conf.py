# https://github.com/ycm-core/YouCompleteMe#option-2-provide-the-flags-manually
def Settings(**kwargs):
    # with open('aaa', 'w') as f:
    #     f.write(str(kwargs))
    language = kwargs['language']
    if language == 'cfamily':
        return {
            'flags': [
                '-x', 'c++',
                '-Wall', '-Wextra', '-Werror',
                '-isystem',
                '/usr/include',
                '-isystem',
                '/usr/local/include',
            ],
        }
    return {}

