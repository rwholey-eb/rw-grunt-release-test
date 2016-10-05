module.exports = function(grunt) {
    'use strict';

    var shell = require('shelljs');
    var path = require('path');

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

    grunt.config.set('gitadd', {
        task: {
            options: {
                message: 'adding dist..',
                force: true
            }
        },
        files: {
            src: [path.resolve(__dirname, './dist')]
        }
    });

    grunt.config.set('gitcommit', {
        task: {
            options: {
                message: 'committing dist..',
                force: true
            }
        },
        files: {
            src: [path.resolve(__dirname, './dist')]
        }
    });

    grunt.config.set('gitpush', {
        task: {
            options: {
                message: 'pushing dist..',
                force: true
            },
        },
        files: {
            src: [path.resolve(__dirname, './dist')]
        }
    })

    grunt.registerTask('publish', 'Publish package to reggie', function() {

        // var pkg = grunt.file.readJSON('package.json'),
        //     cmd = './node_modules/reggie/client.js -u ' + pkg.publishConfig.registry + ' publish';

        // if (grunt.option('no-write')) {
        //     grunt.log.ok('---DRY-RUN----');
        //     grunt.log.ok(cmd);
        // } else {
        //     grunt.log.ok(cmd);
        //     shell.exec(cmd);
        // }
        // grunt.log.ok('Published to Reggie');
    });

    grunt.registerTask('release', function() {

        shell.exec('')

        var bumpTask = 'bump-version' + Array.prototype.slice.call(arguments).map(function(val) {
            return ':' + val;
        });

        grunt.task.run(bumpTask, 'publish');
    });

    grunt.registerTask('add-dist', 'Add dist to repo',function() {
        grunt.task.run('gitadd');
        grunt.task.run('gitcommit');
        grunt.task.run('gitpush')
    });
};
