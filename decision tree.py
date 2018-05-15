from sklearn import tree
import pydotplus
import numpy as np

data = np.loadtxt("iris.txt", delimiter=",", usecols=(0, 1, 2, 3), dtype=float)
target = np.loadtxt("iris.txt", delimiter=",", usecols=(4,), dtype=str)
clf = tree.DecisionTreeClassifier()
clf.fit(data, target)
with open("iris.dot", 'w') as f:
    f = tree.export_graphviz(clf, out_file=f)
dot_data = tree.export_graphviz(clf, out_file=None)
graph = pydotplus.graph_from_dot_data(dot_data)

# 保存生成的决策树图像为pdf文件
graph.write_pdf("iris.pdf")
