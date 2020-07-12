import numpy as np


class Data(object):

    def __init__(self, path):
        self.dataset = self._build(path)

    def split(self, percentage):
        # return train, test (segun el parametro percentage)
        return NotImplemented

    def _build_dataset(sel, path):
        # usar np estructurado para levantar la data y cargarla
        return NotImplemented


class BaseModel(object):

    def __init__(self):
        self.model = None

    def fit(self, X, Y):
        # train del model
        return NotImplemented

    def predict(self, X):
        # return Y hat
        return NotImplemented


class LinearRegression(BaseModel):

    def fit(self, X, Y):
        # calcular W y guardarlo en el modelo
        # self.model = W
        return NotImplemented

    def predict(self, X):
        # usar el modelo para predecir Y hat a partir de X y W

        class LinearRegresion(BaseModel):

            def fit(self, X, Y):
                # calcular W y guardarlo en el modelo
                # self.model = W
                return NotImplemented

            def predict(self, X):
        # usar el modelo para predecir Y hat a partir de X y W


class LinearRegressionAffine(BaseModel):

    def fit(self, X, Y):
        # calcular W y guardarlo en el modelo
        # self.model = W
        return NotImplemented

    def predict(self, X):
        # usar el modelo para predecir Y hat a partir de X y W

        class LinearRegresion(BaseModel):

            def fit(self, X, Y):
                # calcular W y guardarlo en el modelo
                # self.model = W
                return NotImplemented

            def predict(self, X):
        # usar el modelo para predecir Y hat a partir de X y W


class Metric(object):

    def __call__(self, target, prediction):
        return NotImplemented


class MSE(Metric):

    def __call__(self, target, prediction):
        return NotImplemented