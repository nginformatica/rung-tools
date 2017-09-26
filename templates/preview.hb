<!DOCTYPE html>
<html>
    <head>
        <title>Rung CLI Preview</title>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300" rel="stylesheet">
    </head>
    <style>
    body {
        background-color: #BBBBBB;
        padding: 0;
        margin: 0;
        background-image: url(./wallpaper.jpg);
        background-position: center center;
        font-family: Roboto, sans-serif;
    }

    #rung-bar {
        width: 100%;
        height: 64px;
        background-color: rgb(63, 81, 181);
    }

    #rung-alerts {
        margin: 40px;
        width: 100%;
        max-width: calc(100% - 500px);
    }

    .custom-scrollbar::-webkit-scrollbar, textarea::-webkit-scrollbar {
        width: 8px;
        -webkit-appearance: none;
    }

    .custom-scrollbar::-webkit-scrollbar-thumb, textarea::-webkit-scrollbar-thumb {
        background: rgba(200, 200, 200, 0.7);
        min-height: 36px;
        cursor: pointer;
        color: transparent;
    }

    .custom-scrollbar::-webkit-scrollbar-thumb:hover, textarea::-webkit-scrollbar-thumb:hover {
        background: rgba(34, 167, 250, 0.7);
    }

    .card {
        cursor: pointer;
        position: relative;
        width: 145px;
        height: 115px;
        display: inline-block;
        margin: 2px;
        border: 1px solid silver;
        padding: 0 10px;
        padding-top: 10px;
        overflow-x: hidden;
        overflow-y: auto;
        text-align: center;
        font-family: Roboto, sans-serif;
    }

    #logo {
        margin-left: 24px;
        height: 64px;
    }

    #sidebar-header {
        background-color: #596ac6;
    }

    #sidebar {
        width: 440px;
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
    }

    #sidebar-header {
        background-color: #596ac6;
        color: #CCCCCC;
        height: 64px;
        padding-left: 30px;
    }

    #sidebar-fake-line-1 {
        position: absolute;
        top: 0;
    }

    #sidebar-group-name {
        position: relative;
        top: 10px;
        font-size: 20px;
    }

    #sidebar-card-name {
        position: relative;
        overflow: hidden;
        max-height: 20px;
        top: 8px;
    }

    #sidebar-body {
        background-color: #EEEEEE;
        height: calc(100% - 124px);
        text-align: center;
        padding-top: 20px;
    }

    .fake-field {
        width: 200px;
        height: 50px;
        display: inline-table;
    }

    .fake-indicator {
        background-color: #BBBBBB;
        height: 10px;
        width: 50px;
    }

    .fake-value {
        margin-top: 5px;
        background-color: #BBBBBB;
        height: 30px;
        width: 100%;
    }

    #sidebar-comment-box {
        position: absolute;
        bottom: 0;
        right: 0;
        width: 440px;
        background: #EEEEEE;
        height: 50px;
    }

    #sidebar-comment-input {
        width: 365px;
        background-color: #BBBBBB;
        height: 30px;
        position: absolute;
        bottom: 13px;
        right: 60px;
    }

    #sidebar-send-button {
        background-color: #CA2C68;
        width: 40px;
        height: 40px;
        border-radius: 40px;
        position: absolute;
        bottom: 10px;
        right: 10px;
    }

    #markdown-box {
        height: 200px;
        margin: 20px;
        height: calc(100% - 150px);
        overflow-y: scroll;
    }

    #markdown-robot {
        width: 50px;
        height: 50px;
        border-radius: 50px;
        background-color: #AE7C5B;
    }

    #markdown-content {
        position: relative;
        top: -50px;
        left: 60px;
        width: calc(100% - 70px);
        background-color: #E0E0E0;
        padding: 5px;
        text-align: left;
    }

    #markdown-resources img {
        width: 100%;
    }
    </style>
    <body>
        <div id="rung-bar">
            <img src="./rung-logo.png" draggable="false" id="logo" />
        </div>
        <div id="rung-alerts">
            {{#each alerts}}
                <div
                    class="card custom-scrollbar"
                    title="{{title}}"
                    onClick="openAlert(this)">
                    <textarea class="here-be-dragons-title" style="display: none;">{{title}}</textarea>
                    <textarea class="here-be-dragons-comment" style="display: none;">{{comment}}</textarea>
                    <textarea class="here-be-dragons-resources" style="display: none">
                        <div id="markdown-resources">
                        {{#each resources}}
                            <img src="{{this}}" draggable="false" />
                        {{/each}}
                        </div>
                    </textarea>
                    {{{content}}}
                </div>
            {{/each}}
        </div>
        <div id="sidebar">
            <div id="sidebar-header">
                <div id="sidebar-group-name">Rung Developers</div>
                <div id="sidebar-card-name">
                    {{#if sidebar}}
                        {{sidebar.title}}
                    {{/if}}
                </div>
            </div>
            <div id="sidebar-body">
                <div class="fake-field">
                    <div class="fake-indicator"></div>
                    <div class="fake-value"></div>
                </div>
                <div class="fake-field">
                    <div class="fake-indicator"></div>
                    <div class="fake-value"></div>
                </div>
                <div class="fake-field">
                    <div class="fake-indicator"></div>
                    <div class="fake-value"></div>
                </div>
                <div class="fake-field">
                    <div class="fake-indicator"></div>
                    <div class="fake-value"></div>
                </div>
                <div id="markdown-box" class="custom-scrollbar">
                    <div id="markdown-robot"></div>
                    <div id="markdown-content">
                        {{#if sidebar}}
                            {{{sidebar.comment}}}
                            <div id="markdown-resources">
                                {{#each sidebar.resources}}
                                    <img src="{{this}}" draggable="false" />
                                {{/each}}
                            </div>
                        {{/if}}
                    </div>
                </div>
            </div>
            <div id="sidebar-comment-box">
                <div id="sidebar-comment-input"></div>
                <div id="sidebar-send-button"></div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        // Here be dragons :)
        function openAlert(context) {
            const $title = document.querySelector('#sidebar-card-name');
            const $comment = document.querySelector('#markdown-content');

            const title = context.querySelector('.here-be-dragons-title').value;
            const comment = context.querySelector('.here-be-dragons-comment').value;
            const resources = context.querySelector('.here-be-dragons-resources').value
                .split('\n')
                .map(resource => resource.trim())
                .filter(resource => resource !== '')
                .join('');

            $title.innerHTML = title;
            $comment.innerHTML = comment + resources;
        }
    </script>
</html>
