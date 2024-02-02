// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"
import "jquery";
import "bootstrap";
import "adminlte";


const hideFields = () => {
  document.querySelectorAll('.cnpj, .inscricao-estadual, .inscricao-municipal, .ramo-de-atividade, .cod-ibge').forEach(field => {
    field.style.display = 'none';
  });
};

const showFields = () => {
  document.querySelectorAll('.cnpj, .inscricao-estadual, .inscricao-municipal, .ramo-de-atividade, .cod-ibge').forEach(field => {
    field.style.display = 'block';
  });
};


/*
document.addEventListener('DOMContentLoaded', () => {
  const clienteTypeSelect = document.querySelector('#cliente_tipo_cliente');

  hideFields();

    if (clienteTypeSelect){
      clienteTypeSelect.addEventListener('change', () => {
        const clienteType = clienteTypeSelect.value;

        if (clienteType === 'Pessoa Fisica') {
          hideFields();
        } else {
          showFields();
        }
      });
    }

});

*/
document.addEventListener('DOMContentLoaded', () => {
  const clienteTypeSelect = document.querySelector('#cliente_tipo_cliente');

  if (clienteTypeSelect) {
    hideFields();

    clienteTypeSelect.addEventListener('change', () => {
      const clienteType = clienteTypeSelect.value;

      if (clienteType === 'Pessoa Fisica') {
        hideFields();
      } else {
        showFields();
      }
    });
  }
});

