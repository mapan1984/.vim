if !has('python')
    echo "Error: Required vim compiled with +python"
    finish
endif

function! ci#GetCi()

python<<EOF
import sys
import vim
import json

try:
    from urllib2 import urlopen
except:
    from urllib.request import urlopen

try:
    from urllib import urlencode
except:
    from urllib.parse import urlencode

url = r'''http://fanyi.youdao.com/openapi.do'''

data = {
    'keyfrom': 'hidict',
    'key': '1217482697',
    'type': 'data',
    'doctype': 'json',
    'version': '1.1',
}

def get_response(word):
    data['q'] = word 
    url_values = urlencode(data)
    full_url = url + '?' + url_values
    result = urlopen(full_url).read()
    result = json.loads(result, encoding='utf-8')

    translation = result.get('translation')
    if translation:
        print 'Translation:'
        for t in translation:
            print '\t', t.encode('utf-8')

    basic = result.get('basic')
    if basic:
        explains = basic.get('explains')
        if explains:
            print 'Explains:'
            for e in explains:
                print '\t', e.encode('utf-8')

    web = result.get('web')
    if web:
        for item in web:
            print item.get('key').encode('utf-8')
            for v in item.get('value'):
                print '\t', v.encode('utf-8')

word = vim.eval('expand("<cword>")') 

get_response(word)

EOF

endfunction

