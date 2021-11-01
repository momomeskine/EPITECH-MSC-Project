module.exports = {
  lintOnSave: false,
  productionSourceMap: false,
  css: {
    loaderOptions: {
      sass: {
        prependData: `
          @use 'sass:color';
          @import "@/styles/variables.scss";
        `,
      },
    },
  },
}
