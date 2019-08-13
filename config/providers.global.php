<?hh // partial

/**
 * use providers type
 * @see \App\Config\ProvidersType
 */
return dict[
  'providers' => vec[
    \App\Providers\ActionProvider::class,
    \App\Providers\StorageProvider::class,
    \App\Providers\MapperProvider::class,
  ]
];
