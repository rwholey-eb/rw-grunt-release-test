module.exports = function(grunt) {
    'use strict';

    var shell = require('shelljs');

    grunt.renameTask('release', 'bump-version');
    grunt.config.set('bump-version', {
        'options': {
            commitMessage: 'Bumped Project to <%= version %>',
            bump: true,
            file: 'package.json',
            add: true,
            commit: true,
            tag: true,
            push: true,
            pushTags: true,
            npm: false
        }
    });

    grunt.registerTask('publish', 'Publish package to reggie', function() {

    });

    grunt.registerTask('release', function() {

        var bumpTask = 'bump-version' + Array.prototype.slice.call(arguments).map(function(val) {
            return ':' + val;
        });

        grunt.task.run(bumpTask, 'publish');
    });
};
