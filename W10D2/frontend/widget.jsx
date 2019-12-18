import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';
import Autocomplete from './autocomplete';

let tabsArray = [
  {title: "mystuff", content: "mycontent"},
  {title: "secondtab", content: "hfiuwfhkabnkd" },
  {title: "lasttab", content: "blob" }
]

let namesArray = [{ name: "Sami" }, { name: "Richard" }, { name: "Duke" }];

document.addEventListener('DOMContentLoaded', () => {
  const clockRoot = document.getElementById('clock-root');
  const tabsRoot = document.getElementById('tabs-root');
  const autocompleteRoot = document.getElementById('autocomplete-root');
  ReactDOM.render(<Clock />, clockRoot);
  ReactDOM.render(<Tabs tabsProps={tabsArray} />, tabsRoot);
  ReactDOM.render(<Autocomplete namesProps={namesArray}/>, autocompleteRoot);
});