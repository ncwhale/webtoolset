var model_name;

require.config({
  baseUrl: 'js/lib',
  packages: [
    {
      name: 'when',
      location: 'when',
      main: 'when'
    }
  ],
  paths: {
    model: '..',
    jquery: 'jquery-2.1.1.min',
    bootstrap: 'bootstrap.min',
    validator: 'validator.min',
    formvalidation: 'formValidation/formValidation.min',
    bootstrap_validator: 'formValidation/framework/bootstrap.min',
    formvalidation_language: 'formValidation/language'
  },
  shim: {
    bootstrap: {
      deps: ['jquery']
    },
    formvalidation: {
      deps: ['jquery']
    },
    bootstrap_validator: {
      deps: ['bootstrap', 'formvalidation']
    },
    formvalidation_language: {
      deps: ['formvalidation']
    }
  }
});


/*Auto load model script here. */

model_name = window.location.pathname;

if (model_name.slice(-1) === '/') {
  model_name += 'index';
}

requirejs(["model" + model_name]);

//# sourceMappingURL=require-loader.map
