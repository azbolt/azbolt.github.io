var gulp   = require('gulp'); // core gulp
var uncss  = require('gulp-uncss'); // removes unused css
var csso   = require('gulp-csso'); // minify css
var gzip   = require('gulp-gzip'); // gzip compression

gulp.task('uncss', function() {
  return gulp.src('build/assets/stylesheets/*.css')
    .pipe(uncss({
        html: ['build/**/*.html', 'build/*.html'],
        ignore: ['.body_hidden', '.navigation.open',
                 '.burger.active .top', '.burger.active .middle',
                 '.burger.active .bottom', '.navigation.close',
                 '.navigation', '.navigation.open li',
                 '.navigation.open li:nth-of-type(2)',
                 '.navigation.open li:nth-of-type(3)',
                 '.navigation.open li:nth-of-type(4)',
                 '#mc_embed_signup div.mce_inline_error',
                 '.navbar.affix-top', '.navbar.affix',
                 '.navbar .navbar-nav li.active a',
                 '.navbar-inverse .navbar-nav>.active>a'
               ]
    }))
    .pipe(csso())
    .pipe(gulp.dest('./build/assets/stylesheets'))
    .pipe(gzip())
    .pipe(gulp.dest('./build/assets/stylesheets'));
});

// Scan site, remove unused css
gulp.task('buildcss', ['uncss']);
