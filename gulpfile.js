var release = require('gulp-git-release');
var gulp = require('gulp');

gulp.task('pre-release', function() {
     return gulp.src('/dist/')
        .pipe(release({
            prefix: 'target/dist',
            release: true,
            debug: false,
            repository: 'https://github.com/rwholey-eb/rw-grunt-release-test.git'
        }));
    })