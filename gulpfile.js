var release = require('gulp-git-release');
var gulp = require('gulp');

gulp.task('release', function() {
     return gulp.src('/dist/')
        .pipe(release({
            release: true,
            debug: false,
            repository: 'git@github.com:rwholey-eb/rw-grunt-release-test.git'
        }));
    })